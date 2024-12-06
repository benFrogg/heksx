resource "aws_ebs_volume" "eks_storage" {
  availability_zone = "ap-southeast-1a"
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type

  tags = {
    Name    = "heksx-storage"
    Project = "heksx"
  }
}

resource "aws_volume_attachment" "eks_storage_attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.eks_storage.id
  instance_id = var.eks_instance_id
}
