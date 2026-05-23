data "archive_file" "py_message_lambda_zip" {
    type = "zip"
    source_dir = "${path.module}/py/code"
    output_path = "${path.module}/.terraform/py/src.zip"
}
# basic role for lambda
resource "aws_iam_role" "py_message_lambda_role" {
    name = "py-message-lambda-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            },
        ]
    })
}
resource "aws_iam_role_policy_attachment" "py_message_lambda_policy_attachment" {
    role = aws_iam_role.py_message_lambda_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
resource "aws_lambda_function" "py_message_lambda" {
    function_name = "py-message-lambda"
    role = aws_iam_role.py_message_lambda_role.arn
    handler = "lambda.handler"
    runtime = "python3.13"
    filename = data.archive_file.py_message_lambda_zip.output_path
    source_code_hash = filebase64sha256(data.archive_file.py_message_lambda_zip.output_path)
    # timeout = 30
    # memory_size = 128
    # publish = true
    environment {
        variables = {
            MESSAGES_BUCKET = aws_s3_bucket.messages_bucket.id            
        }
    }
}