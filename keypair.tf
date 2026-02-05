
## Creating KeyPair

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "projectkeypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpvpISRsksTXARpIsyQys2FEvu540P1z7CtBbrGG56eLtct1Oki+hvsFMCQGeDG4jjcBm2xq/L8lubd4ToYRYOUzqKnuTmXSv7Z8e+i0K3EYXimsXNK9JGX+cR6yvtDecWXKZi1HUIrkah6xPzT/BvRjlUHoGhPGuSYCsLTsgpoD+24YjxOgNQ1LV+INBYBMVGNYtUfTvs8LFPe7wNEh2agS1ak3M3M05JPRyKgJTdQyJujlksNZlnWdbGGkrpGzXwEk2TqzW0nDnMEgYPGE8fLG39Q8L/LU5S6EPD9Hhnn0AQ8OW0jhk64jMaXlfc6FxgmcvvHMCJqYq4h9o10AtXw2XKxQpbCArtMVd2C9DFbQqaluB6RXZCW4ZIm/CkmiTB2A3dlKfUEk0fIKMv3TBlbQVrjSbRieP5JfcFaXFtJm/awtAPTWHqFHeO82WZPF+BUsuHDAYGLuDojrjeIe/5N35Qr6HMbV/cCreMjUXEJLMQ0FhZsclGxWYZkxl6iRE= ubuntu@ip-172-31-19-237"
}
