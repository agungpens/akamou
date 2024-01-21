<input type="hidden" id="id" value="{{ isset($id) ? $id : '' }}">


<div class="row">
    <div class="col-md-12 text-end">
        <a href="#" class="dt-button create-new btn btn-secondary" tabindex="0" aria-controls="DataTables_Table_0"
            type="button" onclick="MasterDocument.back()">
            <span>
                <i class="bx bx-chevron-left me-sm-2"></i>
                <span class="d-none d-sm-inline-block">Kembali</span>
            </span>
        </a>
    </div>
</div>
<br>
<div class="col-xl-12">
    <div class="card">
        <h5 class="card-header">Form Document Mou</h5>
        <form id="form-template" method="POST">
            <div class="card-body">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <div class="mb-3">
                            <input type="hidden" name="id" id="id"
                                value="{{ isset($data->id) ? $data->id : '' }}">
                            <label class="form-label" for="template">Pilih Template</label>
                            <div class="input-group">
                                <button class="btn btn-outline-primary" type="button" id="button-addon1"
                                    onclick="MasterDocument.showDataTemplate(this)">Pilih</button>
                                <input id="template" type="text" class="form-control rounded required" error="Template"
                                    placeholder="Pilih Data Template" aria-label="Pilih Data Template"
                                    aria-describedby="button-addon1"
                                    value="{{ isset($data->master_template_id) ? $data->nama_template  : '' }}" readonly>
                                <input type="hidden" name="template_id" id="template_id"
                                    value="{{ isset($data->master_template_id) ? $data->master_template_id : '' }}">

                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Nomor</label>
                            <input type="number" class="form-control required" name="nomor" id="nomor"
                                error="Nomor" id="basic-icon-default-fullname" placeholder="Nomor" aria-label="Nama"
                                aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->nomor) ? $data->nomor : '' }}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Tanggal</label>
                            <input type="text" class="form-control required flatpickr" name="tanggal" id="tanggal"
                                error="Tanggal" id="basic-icon-default-fullname" placeholder="YYYY-MM-DD"
                                aria-label="Tanggal" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->tanggal) ? $data->tanggal : '' }}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Tempat</label>
                            <input type="text" class="form-control required" name="tempat" id="tempat"
                                error="Tempat" id="basic-icon-default-fullname" placeholder="Tempat"
                                aria-label="Tempat" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->tempat) ? $data->tempat : '' }}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Tentang</label>
                        <textarea class="form-control required" error="Tentang" placeholder="Tentang" name="tentang" id="tentang" cols="10" rows="5">{!! isset($data->tentang) ? $data->tentang : '' !!}</textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Nama Penanda Tangan</label>
                            <input type="text" class="form-control required" name="nama_penanda_tangan" id="nama_penanda_tangan"
                                error="Nama Penanda Tangan" id="basic-icon-default-fullname" placeholder="Nama Penanda Tangan"
                                aria-label="Nama Penanda Tangan" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->nama_penanda_tangan) ? $data->nama_penanda_tangan : '' }}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Jabatan</label>
                            <input type="text" class="form-control required" name="jabatan" id="jabatan"
                                error="Jabatan" id="basic-icon-default-fullname" placeholder="Jabatan"
                                aria-label="Jabatan" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->jabatan) ? $data->jabatan : '' }}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Jabatan Penanda Tangan</label>
                            <input type="text" class="form-control required" name="jabatan_penanda_tangan" id="jabatan_penanda_tangan"
                                error="Jabatan Penanda Tangan" id="basic-icon-default-fullname" placeholder="Jabatan Penanda Tangan"
                                aria-label="Jabatan Penanda Tangan" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->jabatan_penanda_tangan) ? $data->jabatan_penanda_tangan : '' }}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Nama</label>
                            <input type="text" class="form-control required" name="nama" id="nama"
                                error="Nama" id="basic-icon-default-fullname" placeholder="Nama"
                                aria-label="Nama" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->nama) ? $data->nama : '' }}" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">Alamat Instansi</label>
                                <textarea class="form-control required" error="Alamat Instansi" placeholder="Alamat Instansi" name="alamat_instansi" id="alamat_instansi" cols="10" rows="5">{!! isset($data->alamat_instansi) ? $data->alamat_instansi : '' !!}</textarea>
                        </div>
                    </div>
                    <div class="text-end mt-3 mb-3">
                        @if (isset($data->id))
                        {{-- download file , didalam public/file/$data->file--}}
                        <button class="btn btn-primary me-2" onclick="MasterDocument.viewFile(this, event)" path="{{ $data->file_path }}" nama_file="{{ $data->file }}">
                            <span><i class="bx bx-download me-sm-2"></i>
                                <span class="d-none d-sm-inline-block">Download File</span>
                            </span>
                        </button>

                        @endif
                        <button type="button" class="btn btn-primary me-2"
                            onclick="MasterDocument.submit(this, event)">
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
