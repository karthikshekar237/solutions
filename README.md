# 🚀 SOE Update Notification Lambda

This AWS Lambda function monitors **AWS Systems Manager (SSM) Parameter Store** for updates to Standard Operating Environment (SOE) AMI parameters and sends notifications via **SNS** to inform stakeholders about new SOE releases.

---

## 📌 Features

- Automatically detects updates to specific SOE AMI SSM parameters.
- Sends rich **HTML email notifications** via SNS with:
  - SSM Parameter name.
  - SOE Name.
  - Release date.
  - Link to the SOE User Guide.
- Supports **Dry-Run mode** to test without sending notifications.
- Uses environment variables for SNS topic management.

---

## 🛠️ Technologies Used

- **Python 3.x**
- **AWS Lambda**
- **AWS SNS**
- **AWS SSM Parameter Store**
- **boto3**

---

## ⚙️ Environment Variables

| Variable Name | Description |
|---------------|-------------|
| `SNS_TOPIC_AMAZONLINUX2` | SNS Topic ARN for Amazon Linux 2 updates |
| `SNS_TOPIC_AMAZONLINUX2EKS128` | SNS Topic ARN for Amazon Linux 2 EKS 1.28 updates |
| `SNS_TOPIC_AMAZONLINUX2EKS129` | SNS Topic ARN for Amazon Linux 2 EKS 1.29 updates |
| `SNS_TOPIC_RHEL7` | SNS Topic ARN for RHEL 7 updates |
| `SNS_TOPIC_RHEL8` | SNS Topic ARN for RHEL 8 updates |
| `SNS_TOPIC_RHEL9` | SNS Topic ARN for RHEL 9 updates |
| `SNS_TOPIC_WIN2016_CORE` | SNS Topic ARN for Windows Server 2016 Core updates |
| `SNS_TOPIC_WIN2016_DESKTOP` | SNS Topic ARN for Windows Server 2016 Desktop updates |
| `SNS_TOPIC_WIN2019_CORE` | SNS Topic ARN for Windows Server 2019 Core updates |
| `SNS_TOPIC_WIN2019_DESKTOP` | SNS Topic ARN for Windows Server 2019 Desktop updates |
| `SNS_TOPIC_WIN2022_PREVIEW` | SNS Topic ARN for Windows Server 2022 Preview updates |
| `SNS_TOPIC_TEST_LATEST` | SNS Topic ARN for Test Preview updates |
| `DRY_RUN` | Set to `"true"` to enable dry-run mode (no actual notifications sent) |

---

## 📥 Event Trigger

This Lambda function is triggered by **EventBridge** or another event source that provides the following event structure:

```json
{
  "detail": {
    "name": "/cba-soe/ami-amazonlinux2-latest"
  },
  "time": "2024-03-02T10:30:00Z"
}
```

---

## 🚀 Deployment Instructions

1. **Deploy the Lambda function** (using AWS Console, SAM, CDK, Terraform, etc.).
2. Set the required environment variables for SNS topic ARNs.
3. Configure **EventBridge Rule** or another event source to trigger this Lambda on SSM Parameter Store updates.
4. (Optional) Enable **Dry-Run** mode by setting `DRY_RUN=true`.

---

## ✅ Testing

To test the Lambda:

- Enable `DRY_RUN=true` to simulate without sending notifications.
- Manually invoke the Lambda with a test event.
- Check **CloudWatch Logs** for the notification details.

---

## 📄 User Guide

For details on using the shared AWS CBA Cloud SOE, please visit the [SOE User Guide](https://commbank.atlassian.net/wiki/spaces/SCCS/pages/391611678/Using+the+shared+AWS+CBA+Cloud+SOE).

---

## 🤝 Contributing

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

---

## 📧 Contact

For any queries, please reach out to the **Cloud Platform Team**.
