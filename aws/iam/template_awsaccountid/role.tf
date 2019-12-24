resource "aws_iam_role" "rolecreatefromterraform-admin" {
  name = "FullAdmin"

  assume_role_policy = "${data.aws_iam_policy_document.trust-mgmt-policy.json}"

  tags = {
    tag-key = "Name-Admin Role Create from terraform"
  }
}
# attach admin
resource "aws_iam_role_policy_attachment" "rolecreatefromterraform-admin" {
  role = "${aws_iam_role.rolecreatefromterraform-admin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  depends_on = [aws_iam_role.rolecreatefromterraform-admin]
}