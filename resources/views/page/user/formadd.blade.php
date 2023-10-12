<input type="hidden" id="id" value="{{ isset($id) ? $id : '' }}">


<div class="row">
    <div class="col-md-12 text-end">
        <a href="{{ url('user') }}" class="dt-button create-new btn btn-secondary" tabindex="0"
            aria-controls="DataTables_Table_0" type="button">
            <span><i class="bx bx-chevron-left me-sm-2"></i>
                <span class="d-none d-sm-inline-block">Kembali</span></span>
        </a>

    </div>
</div>
<br>
<div class="col-xl-12">
    <div class="card">
        <h5 class="card-header">Authentication Detail</h5>
        <!-- Account -->
        <form id="formAccountSettings" method="POST" action="{{ url('user/submit') }}">
            @csrf
            <div class="card-body">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <input type="hidden" name="user_id" id="user_id"
                            value="{{ isset($data->id_user) ? $data->id_user : '' }}">
                        <label class="form-label" for="basic-icon-default-fullname">Nama
                            Panggilan</label>
                        <div class="input-group input-group-merge">
                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                    class="bx bx-user"></i></span>
                            <input type="text" class="form-control" name="nama" id="basic-icon-default-fullname"
                                placeholder="Nama" aria-label="Nama" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->nama_user) ? $data->nama_user : '' }}" />
                        </div>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label" for="basic-icon-default-fullname">Username</label>
                        <div class="input-group input-group-merge">
                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                    class="bx bx-user"></i></span>
                            <input type="text" class="form-control" name="username" id="basic-icon-default-fullname"
                                placeholder="username" aria-label="username"
                                aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->username) ? $data->username : '' }}" />
                        </div>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label" for="basic-icon-default-fullname">Password
                        </label>
                        <div class="input-group input-group-merge">
                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                    class="bx bx-user"></i></span>
                            <input type="password" class="form-control" name="password" id="basic-icon-default-fullname"
                                placeholder="Password " aria-label="password"
                                aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->password) ? $data->password : '' }}" />
                        </div>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label" for="role">Pilih Role</label>
                        <select id="role" name="role" class="select2 form-select required"
                            data-allow-clear="true" error="role">
                            <option value="{{ isset($data->role_id) ? $data->role_id : '' }}">
                                {{ isset($data->nama_role) ? $data->nama_role : '' }}</option>
                            @foreach ($role as $item)
                                <option value="{{ $item->id }}">{{ $item->nama_role }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label" for="prodi">Pilih prodi</label>
                        <select id="prodi" name="prodi" class="select2_prodi form-select required"
                            data-allow-clear="true" error="prodi">
                            <option value="{{ isset($data->prodi_id) ? $data->prodi_id : '' }}">
                                {{ isset($data->nama_prodi) ? $data->nama_prodi : '' }}
                            </option>
                            @foreach ($prodi as $item)
                                <option value="{{ $item->id }}">{{ $item->nama_prodi }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="text-end mt-2 mb-3">
                        <button type="submit" class="btn btn-primary me-2">
                            <span><i class="bx bx-check-circle me-sm-2"></i>
                                <span class="d-none d-sm-inline-block">Submit</span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<br>

@section('scripts')
    @if (session()->has('success'))
        <script>
            Toast.success('Informasi', `{{ session('success') }}`);
        </script>
    @endif
    @if (session()->has('gagal'))
        <script>
            Toast.error('Informasi', `{{ session('gagal') }}`);
        </script>
    @endif
    @if (session()->has('error'))
        <script>
            Toast.error('Informasi', `{{ session('error') }}`);
        </script>
    @endif
    @if (count($errors) > 0)
        <script>
            Toast.error('Informasi', `{{ $errors->first() }}`);
        </script>
    @endif
@endsection
