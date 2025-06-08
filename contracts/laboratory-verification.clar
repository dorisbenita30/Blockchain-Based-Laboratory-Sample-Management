;; Laboratory Verification Contract
;; Manages registration and verification of testing laboratories

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_LAB_EXISTS (err u101))
(define-constant ERR_LAB_NOT_FOUND (err u102))
(define-constant ERR_INVALID_STATUS (err u103))

;; Laboratory data structure
(define-map laboratories
  { lab-id: uint }
  {
    name: (string-ascii 100),
    address: (string-ascii 200),
    certification: (string-ascii 50),
    status: (string-ascii 20),
    registered-at: uint,
    verified-by: principal
  }
)

(define-data-var lab-counter uint u0)

;; Register a new laboratory
(define-public (register-laboratory (name (string-ascii 100)) (address (string-ascii 200)) (certification (string-ascii 50)))
  (let ((lab-id (+ (var-get lab-counter) u1)))
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (map-set laboratories
      { lab-id: lab-id }
      {
        name: name,
        address: address,
        certification: certification,
        status: "pending",
        registered-at: block-height,
        verified-by: tx-sender
      }
    )
    (var-set lab-counter lab-id)
    (ok lab-id)
  )
)

;; Verify a laboratory
(define-public (verify-laboratory (lab-id uint))
  (let ((lab (unwrap! (map-get? laboratories { lab-id: lab-id }) ERR_LAB_NOT_FOUND)))
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (map-set laboratories
      { lab-id: lab-id }
      (merge lab { status: "verified" })
    )
    (ok true)
  )
)

;; Get laboratory details
(define-read-only (get-laboratory (lab-id uint))
  (map-get? laboratories { lab-id: lab-id })
)

;; Check if laboratory is verified
(define-read-only (is-laboratory-verified (lab-id uint))
  (match (map-get? laboratories { lab-id: lab-id })
    lab (is-eq (get status lab) "verified")
    false
  )
)
