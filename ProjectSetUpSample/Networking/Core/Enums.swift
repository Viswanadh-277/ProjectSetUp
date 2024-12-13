public enum Route<T> {
  case parameters(T)
  case multipart(MultipartInput<T>)
  case uploadFiles(UploadFileRequestInput)
}

public enum FileType: String {
  case vidoes = "videos"
  case thumb = "thumbs"
}
