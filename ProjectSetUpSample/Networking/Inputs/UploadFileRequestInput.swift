import Foundation

/// Structure representing data required to build `Upload file` request.
public struct UploadFileRequestInput {
  /// The URL of the file to be uploaded.
  public let localSource: URL
  
  /// The URL of the endpoint which is presignedURL
  public let destination: URL
  
  /// The type of the file.
  public let fileType: FileType
  
  public init(localSource: URL, destination: URL, fileType: FileType) {
    self.localSource = localSource
    self.destination = destination
    self.fileType = fileType
  }
}

/// Example code is below
/// public func uploadFile(from source: URL, input: PresignedUrlRequestInput) async -> NetworkTask<EmptyResponse> {
///   let router = Router<UploadURL>.presignedUrl(input)
///   let task = await networkingHandler.request(router)
   
///   switch await task.result {
///      case let .success(response):
///         let input = UploadFileRequestInput(source: source, destination: response.uploadUrl, fileType: input.fileType)
///         let router = Router<EmptyResponse>.uploadFile(input)
///         return await networkingHandler.request(router)
///      case let.failure(error): return NetworkTask<EmptyResponse>(operation: { throw error })
///   }
/// }
