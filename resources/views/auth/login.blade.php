@extends('layouts.client')
@section('content-client')
<style>
    .content-footer {
    text-align: center;
    margin-top: 20px;
}

.btn-link {
    display: inline-block;
    background: #fff;
    padding: 10px 20px;
    border: 1px solid #cccccc;
    font-size: 14px;
    margin:  0 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    outline: none;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.btn-link:hover {
    border: 1px solid rgb(28, 47, 127);
    color: rgb(28, 47, 127);
    text-decoration: none;
}

</style>
<div class="container_fullwidth content-page">
    <div class="container">
        <div class="col-md-12 container-page">
            <div class="checkout-page">
              <ol class="checkout-steps">
                <li class="steps active">
                  <h4 class="title-steps text-center">
                    Đăng Nhập
                  </h4>
                  <div class="step-description">
                    <div class="row">
                      <div class="col-md-12 col-sm-12">
                        <div class="run-customer">
                          <form action="{{ route('user.login') }}" method="POST" id="login-form__js">
                            @csrf
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email</label>
                              <input type="text" class="form-control" value="{{ old('email') }}" id="email" name="email" placeholder="Nhập email">
                              @if ($errors->get('email'))
                                <span id="email-error" class="error invalid-feedback" style="display: block">
                                  {{ implode(", ",$errors->get('email')) }}
                                </span>
                              @endif
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Mật Khẩu</label>
                              <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu">
                              @if ($errors->get('password'))
                                <span id="password-error" class="error invalid-feedback" style="display: block">
                                  {{ implode(", ",$errors->get('password')) }}
                                </span>
                              @endif
                            </div>
                            <div class="text-center">
                                <button>
                                  Đăng Nhập
                                </button>
                            </div>
                            <div class="content-footer">
                                <a href="{{ route('user.forgot_password_create') }}" class="btn-link">
                                  Quên mật khẩu
                                </a>
                                <a href="{{ route('user.register') }}" class="btn-link">
                                  Đăng kí tài khoản
                                </a>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
              </ol>
            </div>
          </div>
    </div>
</div>
@vite(['resources/common/js/login.js'])
@endsection
