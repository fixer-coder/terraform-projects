output "codepipeline_name" {
  description = "The name of the created CodePipeline"
  value       = aws_codepipeline.codepipeline.name
}
