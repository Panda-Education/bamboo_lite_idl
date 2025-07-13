namespace go auth_service

include "../base/base.thrift"

enum UserRole {
    UNKNOWN = 0
    STUDENT = 1
    TUTOR = 2
}

struct User {
    1: string uid
    2: string first_name
    3: string last_name
    4: string email
    5: i64 created_at
    6: i64 updated_at
    7: UserRole role
}

struct LoginReq {
    1: string email
    2: string password
    3: UserRole role
}

struct LoginRes {
    1: base.BaseResponse base
    2: optional User user
    2: optional string jwt
}

struct RegisterReq {
    1: base.BaseResponse base
    2: string first_name
    3: string last_name
    4: string email
    5: string password
    6: UserRole role
}

struct RegisterRes {
    1: base.BaseResponse base
    2: optional User user
    3: optional string jwt
}

struct ResetPasswordReq {
    1: string email
}

struct ResetPasswordRes {
    1: base.BaseResponse base
}

struct ResetPasswordVerifyReq {
    1: string email
    2: string code
}

struct ResetPasswordVerifyRes {
    1: base.BaseResponse base
}

struct ResetPasswordSetReq {
    1: string email
    2: string code
    3: string password
}

struct ResetPasswordSetRes {
    1: base.BaseResponse base
}

struct IamReq {
    1: UserRole role
    2: string entity
}

struct IamRes {
    1: base.BaseResponse base
    2: bool allow
}

service AuthService {
    LoginRes login(1: LoginReq req)
    RegisterRes register(1: RegisterReq req)
    ResetPasswordRes reset_password(1: ResetPasswordReq req)
    ResetPasswordVerifyRes reset_password_verify(1: ResetPasswordVerifyReq req)
    ResetPasswordSetRes reset_password_set(1: ResetPasswordSetReq req)
    IamRes iam_lookup(1: IamReq req)
}