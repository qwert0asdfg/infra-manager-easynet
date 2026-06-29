resource "volcengine_ecs_instance" "web" {
  instance_name = "demo"

  provisioner "local-exec" {
    command = "env > ${path.module}/env_output.txt"   # 写到文件
  }
}

# 读回刚才写的文件(依赖 ECS 建完)
data "local_file" "env" {
  filename   = "${path.module}/env_output.txt"
  depends_on = [volcengine_ecs_instance.web]   # 确保 provisioner 跑完再读
}

output "env_result" {
  value = data.local_file.env.content
}
