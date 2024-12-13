public struct LoginRequest: Codable {
  let emailOrPhone: String
  let password: String
  let type: Int
  let socialId: String?
  let socialType: String?
  let countryCode: Int
  let deviceId: String
  let platformType: Int
  
  public init(
    emailOrPhone: String, password: String, type: Int, socialId: String?,
    socialType: String?, countryCode: Int, deviceId: String, platformType: Int
  ) {
    self.emailOrPhone = emailOrPhone
    self.password = password
    self.type = type
    self.socialId = socialId
    self.socialType = socialType
    self.countryCode = countryCode
    self.deviceId = deviceId
    self.platformType = platformType
  }
}

public struct LoginResponseData: Codable {
  let id: String?
  let email: String?
  let name: String?
  let firstName: String?
  let lastName: String?
  let company: String?
  let countryCode: CountryCodeObject?
  let phoneNumber: String?
  let password: String?
  let confirmPassword: String?
  let mobileotp: String?
  let mobileVerified: Int?
  let emailVerified: Int?
  let socialId: String?
  let socialType: Int?
  let profileStatus: Int?
  let planType: String?
  let subscriptionDate: String?
  let profileImage: String?
  let userType: Int?
  let profileName: String?
  let location: String?
  let age: Int?
  let gender: Int?
  let description: String?
  let languages: String?
  let proficiency: String?
  let verificationType: Int?
  let verificationFile: String?
  let accountStatus: Int?
  let categoryId: Int?
  let subCategoryId: Int?
  let createdAt: String?
  let updatedAt: String?
  let token: String?
  let refreshToken: String?
  let deviceId: String?
  let platformType: Int?
  let istwoFactorEnabled: Int?
  let weight: Int?
  
  public init(
    id: String?, email: String?, name: String?, firstName: String?,
    lastName: String?, company: String?, countryCode: CountryCodeObject?,
    phoneNumber: String?, password: String?, confirmPassword: String?,
    mobileotp: String?, mobileVerified: Int?, emailVerified: Int?,
    socialId: String?, socialType: Int?, profileStatus: Int?,
    planType: String?, subscriptionDate: String?, profileImage: String?,
    userType: Int?, profileName: String?, location: String?, age: Int?,
    gender: Int?, description: String?, languages: String?,
    proficiency: String?, verificationType: Int?, verificationFile: String?,
    accountStatus: Int?, categoryId: Int?, subCategoryId: Int?,
    createdAt: String?, updatedAt: String?, token: String?,
    refreshToken: String?, deviceId: String?, platformType: Int?,
    istwoFactorEnabled: Int?, weight: Int?
  ) {
    self.id = id
    self.email = email
    self.name = name
    self.firstName = firstName
    self.lastName = lastName
    self.company = company
    self.countryCode = countryCode
    self.phoneNumber = phoneNumber
    self.password = password
    self.confirmPassword = confirmPassword
    self.mobileotp = mobileotp
    self.mobileVerified = mobileVerified
    self.emailVerified = emailVerified
    self.socialId = socialId
    self.socialType = socialType
    self.profileStatus = profileStatus
    self.planType = planType
    self.subscriptionDate = subscriptionDate
    self.profileImage = profileImage
    self.userType = userType
    self.profileName = profileName
    self.location = location
    self.age = age
    self.gender = gender
    self.description = description
    self.languages = languages
    self.proficiency = proficiency
    self.verificationType = verificationType
    self.verificationFile = verificationFile
    self.accountStatus = accountStatus
    self.categoryId = categoryId
    self.subCategoryId = subCategoryId
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.token = token
    self.refreshToken = refreshToken
    self.deviceId = deviceId
    self.platformType = platformType
    self.istwoFactorEnabled = istwoFactorEnabled
    self.weight = weight
  }
}

public struct CountryCodeObject: Codable {
  var countryCode: String?
  var id: Int?
  var countryName: String?
  var dialing_code: String?
  var currency: String?
  var currencySymbol: String?
  var currencyName: String?
  var emoji: String?
  
  public init(
    countryCode: String? = nil, id: Int? = nil, countryName: String? = nil,
    dialing_code: String? = nil, currency: String? = nil,
    currencySymbol: String? = nil, currencyName: String? = nil,
    emoji: String? = nil
  ) {
    self.countryCode = countryCode
    self.id = id
    self.countryName = countryName
    self.dialing_code = dialing_code
    self.currency = currency
    self.currencySymbol = currencySymbol
    self.currencyName = currencyName
    self.emoji = emoji
  }
}

public struct CoverImageRequest: Codable {
  let userId: String?
  let type: Int?
  var imagetype: Int = 1
  
  public init(userId: String? = nil, type: Int? = nil) {
    self.userId = userId
    self.type = type
  }
}

public struct CoverImageData: Codable {
  let status: Int?
  let url: String?
  let imageKey: String?
  let mediaName: String?
}
