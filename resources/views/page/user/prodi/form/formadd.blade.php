<input type="hidden" id="id" value="{{ isset($id) ? $id : '' }}">


<div class="row">
    <div class="col-md-12 text-end">
        <a href="{{ url('prodi') }}" class="dt-button create-new btn btn-secondary" tabindex="0"
            aria-controls="DataTables_Table_0" type="button">
            <span><i class="bx bx-chevron-left me-sm-2"></i>
                <span class="d-none d-sm-inline-block">Kembali</span></span>
        </a>

    </div>
</div>
<br>
<div class="col-xl-12">
    <div class="card">
        <h5 class="card-header">Form Prodi Mou</h5>
        <!-- Account -->
        <form id="form-prodi" method="POST" action="{{ url('prodi/submit') }}">
            @csrf
            <div class="card-body">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <input type="hidden" name="id" id="id"
                            value="{{ isset($data->id) ? $data->id : '' }}">
                        <label class="form-label" for="basic-icon-default-fullname">Nama
                            Prodi</label>
                        <div class="input-group input-group-merge">
                            <span id="basic-icon-default-fullname2" class="input-group-text"><i
                                    class="bx bx-user"></i></span>
                            <input type="text" class="form-control required" name="nama_prodi" id="nama_prodi"
                                error="Nama prodi" id="basic-icon-default-fullname" placeholder="Nama Prodi"
                                aria-label="Nama" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->nama_prodi) ? $data->nama_prodi : '' }}" />
                        </div>
                    </div>
                    <div class="col-md-6"></div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label" for="basic-icon-default-fullname">Keterangan</label>
                        <div id="keterangan">{!! isset($data->keterangan) ? $data->keterangan : '' !!}</div>
                    </div>

                    <div class="text-end mt-2 mb-3">
                        <button type="button" class="btn btn-primary me-2" onclick="Prodi.submit(this, event)">
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
