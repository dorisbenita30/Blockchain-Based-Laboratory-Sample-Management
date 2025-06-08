# Blockchain-Based Laboratory Sample Management System

A comprehensive blockchain solution for managing laboratory samples, ensuring traceability, verification, and quality assurance throughout the entire sample lifecycle.

## Overview

This system provides end-to-end tracking and verification of laboratory samples using smart contracts built on the Stacks blockchain with Clarity. The solution ensures data integrity, maintains chain of custody, and enforces quality standards for laboratory operations.

## Features

### 🏥 Laboratory Verification
- Register and verify testing laboratories
- Maintain laboratory certifications and credentials
- Track laboratory status and compliance

### 🧪 Sample Tracking
- Create and track samples throughout their lifecycle
- Maintain detailed sample history and metadata
- Assign samples to verified laboratories
- Real-time status updates

### 🔗 Chain of Custody
- Immutable custody transfer records
- Track sample handlers and locations
- Monitor storage conditions and integrity
- Witness verification support

### ✅ Result Verification
- Secure storage of test results
- Multi-level verification process
- Quality control integration
- Confidence level tracking

### 🛡️ Quality Assurance
- Define and enforce quality standards
- Monitor laboratory compliance
- Conduct and record audits
- Track corrective actions

## Smart Contracts

### 1. Laboratory Verification Contract (\`laboratory-verification.clar\`)
Manages the registration and verification of testing laboratories.

**Key Functions:**
- \`register-laboratory\`: Register a new laboratory
- \`verify-laboratory\`: Verify a registered laboratory
- \`get-laboratory\`: Retrieve laboratory details
- \`is-laboratory-verified\`: Check verification status

### 2. Sample Tracking Contract (\`sample-tracking.clar\`)
Tracks samples throughout their entire lifecycle.

**Key Functions:**
- \`create-sample\`: Create a new sample record
- \`update-sample-status\`: Update sample status
- \`assign-to-lab\`: Assign sample to a laboratory
- \`get-sample\`: Retrieve sample details
- \`get-sample-history\`: View sample history

### 3. Chain of Custody Contract (\`chain-of-custody.clar\`)
Maintains detailed chain of custody records.

**Key Functions:**
- \`transfer-custody\`: Transfer sample custody
- \`get-custody-record\`: Retrieve custody transfer details
- \`get-current-custody\`: Get current custody holder
- \`verify-custody-chain\`: Verify chain integrity

### 4. Result Verification Contract (\`result-verification.clar\`)
Manages test results and verification processes.

**Key Functions:**
- \`submit-test-result\`: Submit laboratory test results
- \`verify-test-result\`: Verify submitted results
- \`submit-qc-result\`: Submit quality control results
- \`get-test-result\`: Retrieve test results
- \`is-result-verified\`: Check verification status

### 5. Quality Assurance Contract (\`quality-assurance.clar\`)
Ensures compliance with quality standards.

**Key Functions:**
- \`create-quality-standard\`: Define quality standards
- \`update-lab-compliance\`: Update compliance status
- \`record-audit\`: Record audit results
- \`get-quality-standard\`: Retrieve quality standards
- \`check-lab-compliance-status\`: Check overall compliance

## Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd lab-sample-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## Usage

### Deploying Contracts

Deploy the contracts in the following order:
1. Laboratory Verification Contract
2. Sample Tracking Contract
3. Chain of Custody Contract
4. Result Verification Contract
5. Quality Assurance Contract

### Sample Workflow

1. **Laboratory Registration**: Register and verify laboratories
2. **Sample Creation**: Create sample records with metadata
3. **Custody Transfer**: Transfer samples between parties
4. **Laboratory Assignment**: Assign samples to verified labs
5. **Testing**: Conduct tests and submit results
6. **Verification**: Verify test results and quality controls
7. **Compliance**: Monitor and audit quality standards

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Test files cover:
- Laboratory verification functionality
- Sample tracking operations
- Chain of custody management
- Result verification processes
- Quality assurance compliance

## Security Considerations

- **Access Control**: Only authorized parties can perform sensitive operations
- **Data Integrity**: All data is stored immutably on the blockchain
- **Verification**: Multi-level verification ensures result accuracy
- **Audit Trail**: Complete audit trail for all operations
- **Quality Standards**: Enforced compliance with industry standards

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or support, please open an issue in the repository or contact the development team.

