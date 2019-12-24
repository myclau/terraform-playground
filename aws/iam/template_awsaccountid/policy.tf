data "aws_iam_policy_document" "trust-mgmt-policy" {
  statement {
    effect = "Allow"
    principals {
        type = "AWS"
        identifiers = ["arn:aws:iam::${var.mgmt_account_id}:root"]
    }
    
    actions = ["sts:AssumeRole"]
  }
}