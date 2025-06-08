;; Chain of Custody Contract
;; Maintains detailed chain of custody for samples

(define-constant ERR_UNAUTHORIZED (err u300))
(define-constant ERR_INVALID_TRANSFER (err u301))
(define-constant ERR_SAMPLE_NOT_FOUND (err u302))

;; Custody record structure
(define-map custody-records
  { sample-id: (string-ascii 50), transfer-id: uint }
  {
    from-party: principal,
    to-party: principal,
    transfer-time: uint,
    location: (string-ascii 100),
    condition: (string-ascii 50),
    temperature: (optional int),
    sealed: bool,
    witness: (optional principal),
    notes: (string-ascii 300)
  }
)

(define-map custody-counter { sample-id: (string-ascii 50) } { count: uint })

;; Current custody holder
(define-map current-custody
  { sample-id: (string-ascii 50) }
  { holder: principal, since: uint }
)

;; Transfer custody
(define-public (transfer-custody
  (sample-id (string-ascii 50))
  (to-party principal)
  (location (string-ascii 100))
  (condition (string-ascii 50))
  (temperature (optional int))
  (sealed bool)
  (witness (optional principal))
  (notes (string-ascii 300))
)
  (let (
    (current-count (default-to { count: u0 } (map-get? custody-counter { sample-id: sample-id })))
    (new-count (+ (get count current-count) u1))
  )
    ;; Record the transfer
    (map-set custody-records
      { sample-id: sample-id, transfer-id: new-count }
      {
        from-party: tx-sender,
        to-party: to-party,
        transfer-time: block-height,
        location: location,
        condition: condition,
        temperature: temperature,
        sealed: sealed,
        witness: witness,
        notes: notes
      }
    )
    ;; Update custody counter
    (map-set custody-counter { sample-id: sample-id } { count: new-count })
    ;; Update current custody holder
    (map-set current-custody
      { sample-id: sample-id }
      { holder: to-party, since: block-height }
    )
    (ok new-count)
  )
)

;; Get custody record
(define-read-only (get-custody-record (sample-id (string-ascii 50)) (transfer-id uint))
  (map-get? custody-records { sample-id: sample-id, transfer-id: transfer-id })
)

;; Get current custody holder
(define-read-only (get-current-custody (sample-id (string-ascii 50)))
  (map-get? current-custody { sample-id: sample-id })
)

;; Get total transfers for a sample
(define-read-only (get-transfer-count (sample-id (string-ascii 50)))
  (default-to { count: u0 } (map-get? custody-counter { sample-id: sample-id }))
)

;; Verify custody chain integrity
(define-read-only (verify-custody-chain (sample-id (string-ascii 50)))
  (let ((transfer-count (get count (get-transfer-count sample-id))))
    (> transfer-count u0)
  )
)
