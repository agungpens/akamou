    <div class="row">
        <div class="col-md-12">
            <div class="nav-align-top mb-4">
                <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
                            data-bs-target="#navs-pills-justified-profile" aria-controls="navs-pills-justified-profile"
                            aria-selected="true">
                            <i class="tf-icons bx bx-user"></i> Profile

                        </button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                            data-bs-target="#navs-pills-justified-authentication"
                            aria-controls="navs-pills-justified-authentication" aria-selected="false">
                            <i class="tf-icons bx bx-key"></i> Authentication
                        </button>
                    </li>

                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="navs-pills-justified-profile" role="tabpanel">
                        <h5 class="card-header">Profile Details</h5>
                        <!-- Account -->
                        <form id="formAccountSettings" method="POST" action="{{ url('profile', session('id')) }}"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="card-body">
                                <div class="d-flex align-items-start align-items-sm-center gap-4">
                                    @if (isset($data['detail_user']->foto))
                                        <img src="{{ asset('img/foto-profile/' . $data['detail_user']->foto) }}"
                                            alt="user-avatar" class="d-block rounded" height="100" width="100"
                                            id="uploadedAvatar" />
                                    @else
                                        <img src="{{ asset('assets/img/avatars/profile_man.png') }}" alt="user-avatar"
                                            class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                                    @endif

                                    <div class="button-wrapper">
                                        <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                            <span class="d-none d-sm-block">Upload new photo</span>
                                            <i class="bx bx-upload d-block d-sm-none"></i>
                                            <input type="file" id="upload" class="account-file-input"
                                                name="foto" hidden accept="image/png, image/jpeg" />
                                        </label>
                                        <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                                    </div>
                                </div>
                            </div>
                            <hr class="my-0" />
                            <div class="card-body">
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <input type="hidden" name="user_id" id="user_id" value="{{ session('id') }}">
                                        <input type="hidden" name="id" id="id"
                                            value="{{ isset($data['detail_user']->id) ? $data['detail_user']->id : '' }}">
                                        <input type="hidden" name="foto_lama" id="foto_lama"
                                            value="{{ isset($data['detail_user']->foto) ? $data['detail_user']->foto : '' }}">
                                        <label class="form-label" for="basic-icon-default-fullname">Nama Lengkap</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                                    class="bx bx-user"></i></span>
                                            <input type="text" class="form-control" name="nama_lengkap"
                                                id="basic-icon-default-fullname" placeholder="Nama lengkap"
                                                aria-label="Nama lengkap"
                                                aria-describedby="basic-icon-default-fullname2"
                                                value="{{ isset($data['detail_user']->nama_lengkap) ? $data['detail_user']->nama_lengkap : '' }}" />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label" for="basic-icon-default-phone">Nomor Hp</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-phone2" class="input-group-text"><i
                                                    class="bx bx-phone"></i></span>
                                            <input type="text" name="no_hp" id="basic-icon-default-phone"
                                                class="form-control phone-mask" placeholder="658 799 8941"
                                                aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2"
                                                value="{{ isset($data['detail_user']->no_hp) ? $data['detail_user']->no_hp : '' }}" />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label for="alamat" class="form-label">Alamat</label>
                                        <textarea name="alamat" class="form-control" id="alamat" cols="20" rows="5">{{ isset($data['detail_user']->alamat) ? $data['detail_user']->alamat : '' }}</textarea>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <small class="text-dark fw-semibold">Jenis Kelamin</small>

                                        @if (isset($data['detail_user']->jenis_kelamin))
                                            @if ($data['detail_user']->jenis_kelamin == 'L')
                                                <div class="form-check mt-3">
                                                    <input name="jenis_kelamin" class="form-check-input"
                                                        type="radio" value="L" id="laki_laki" checked />
                                                    <label class="form-check-label" for="laki_laki"> Laki - Laki
                                                    </label>
                                                </div>
                                                <div class="form-check mt-3">
                                                    <input name="jenis_kelamin" class="form-check-input"
                                                        type="radio" value="P" id="perempuan" />
                                                    <label class="form-check-label" for="perempuan"> Perempuan</label>
                                                </div>
                                            @else
                                                <div class="form-check mt-3">
                                                    <input name="jenis_kelamin" class="form-check-input"
                                                        type="radio" value="L" id="laki_laki" />
                                                    <label class="form-check-label" for="laki_laki"> Laki - Laki
                                                    </label>
                                                </div>
                                                <div class="form-check mt-3">
                                                    <input name="jenis_kelamin" class="form-check-input"
                                                        type="radio" value="P" id="perempuan" checked />
                                                    <label class="form-check-label" for="perempuan"> Perempuan</label>
                                                </div>
                                            @endif
                                        @else
                                            <div class="form-check mt-3">
                                                <input name="jenis_kelamin" class="form-check-input" type="radio"
                                                    value="L" id="laki_laki" />
                                                <label class="form-check-label" for="laki_laki"> Laki - Laki </label>
                                            </div>
                                            <div class="form-check mt-3">
                                                <input name="jenis_kelamin" class="form-check-input" type="radio"
                                                    value="P" id="perempuan" />
                                                <label class="form-check-label" for="perempuan"> Perempuan</label>
                                            </div>
                                        @endif
                                    </div>
                                </div>

                                <div class="float-end mt-2 mb-3">
                                    <button type="submit" class="btn btn-primary me-2">Save changes</button>
                                    <button type="button" class="btn btn-outline-secondary"
                                        onclick="history.back()">kembali</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="navs-pills-justified-authentication" role="tabpanel">
                        <h5 class="card-header">Authentication Detail</h5>
                        <!-- Account -->
                        <form id="formAccountSettings" method="POST"
                            action="{{ url('profile/auth', session('id')) }}">
                            @csrf
                            <div class="card-body">
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <input type="hidden" name="user_id" id="user_id"
                                            value="{{ session('id') }}">
                                        <input type="hidden" name="id" id="id"
                                            value="{{ isset($data['detail_user']->id) ? $data['detail_user']->id : '' }}">
                                        <label class="form-label" for="basic-icon-default-fullname">Nama
                                            Panggilan</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                                    class="bx bx-user"></i></span>
                                            <input type="text" class="form-control" name="nama"
                                                id="basic-icon-default-fullname" placeholder="Nama" aria-label="Nama"
                                                aria-describedby="basic-icon-default-fullname2"
                                                value="{{ isset($data['detail_user']->nama) ? $data['detail_user']->nama : '' }}" />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label" for="basic-icon-default-fullname">Username</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                                    class="bx bx-user"></i></span>
                                            <input type="text" class="form-control" name="username"
                                                id="basic-icon-default-fullname" placeholder="username"
                                                aria-label="username" aria-describedby="basic-icon-default-fullname2"
                                                value="{{ isset($data['detail_user']->username) ? $data['detail_user']->username : '' }}" />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label" for="basic-icon-default-fullname">Password
                                            Lama</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                                    class="bx bx-user"></i></span>
                                            <input type="password" class="form-control" name="password_lama"
                                                id="basic-icon-default-fullname" placeholder="Password Lama"
                                                aria-label="password_lama"
                                                aria-describedby="basic-icon-default-fullname2" />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label" for="basic-icon-default-fullname">Password
                                            Baru</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                                    class="bx bx-user"></i></span>
                                            <input type="password" class="form-control" name="password_baru"
                                                id="basic-icon-default-fullname" placeholder="Password Baru"
                                                aria-label="password_baru"
                                                aria-describedby="basic-icon-default-fullname2"
                                                value="{{ isset($data['detail_user']->password_baru) ? $data['detail_user']->password_baru : '' }}" />
                                        </div>
                                    </div>

                                    <div class="float-end mt-2 mb-3">
                                        <button type="submit" class="btn btn-primary me-2">Save changes</button>
                                        <button type="button" class="btn btn-outline-secondary"
                                            onclick="history.back()">kembali</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @section('scripts')
        @if (session()->has('success'))
            <script>
                Toast.success(`Success`,`{{ session('success') }}`);
            </script>
        @endif
        @if (session()->has('gagal'))
            <script>
                Toast.error(`Gagal`,`{{ session('gagal') }}`);
            </script>
        @endif
        @if (session()->has('error'))
            <script>
                Toast.error(`Error`,`{{ session('error') }}`);
            </script>
        @endif
        @if (count($errors) > 0)
            <script>
                Toast.error(`Error`,`{{ $errors->first() }}`);
            </script>
        @endif
    @endsection
