<input type="hidden" id="id" value="{{ isset($id) ? $id : '' }}">


<div class="row">
    <div class="col-md-12 text-end">
        <a href="#" class="dt-button create-new btn btn-secondary" tabindex="0" aria-controls="DataTables_Table_0"
            type="button" onclick="LogUser.back()">
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
        <h5 class="card-header">Detail Action  / Log User</h5>
        <div class="card-body">
            <div class="row">
                <div class="mb-3 col-md-6">
                    <label class="form-label" for="basic-icon-default-fullname">Nama User</label>
                    <input type="text" class="form-control required" name="nama_username" id="nama_username"
                        error="Nama User" id="basic-icon-default-fullname" placeholder="Nama User" aria-label="Nama"
                        aria-describedby="basic-icon-default-fullname2"
                        value="{{ isset($data['data_user']['nama']) ? $data['data_user']['nama'] : '' }}" readonly/>
                </div>
                <div class="mb-3 col-md-6">
                    <label class="form-label" for="basic-icon-default-fullname">IP</label>
                    <input type="text" class="form-control required" name="ip" id="ip"
                        error="IP" id="basic-icon-default-fullname" placeholder="IP"
                        aria-describedby="basic-icon-default-fullname2"
                        value="{{ isset($data['ip']) ? $data['ip'] : '' }}" readonly/>
                </div>
                <div class="mb-3 col-md-6">
                    <label class="form-label" for="basic-icon-default-fullname">action</label>
                    <input type="text" class="form-control required" name="action" id="action"
                        error="action" id="basic-icon-default-fullname" placeholder="action"
                        aria-describedby="basic-icon-default-fullname2"
                        value="{{ isset($data['action']) ? $data['action'] : '' }}" readonly/>
                </div>
                <div class="mb-3 col-md-6">
                    <label class="form-label" for="basic-icon-default-fullname">Waktu</label>
                    <input type="text" class="form-control required" name="created_at" id="created_at"
                        error="created_at" id="basic-icon-default-fullname" placeholder="created_at"
                        aria-describedby="basic-icon-default-fullname2"
                        value="{{ isset($data['created_at']) ? $data['created_at'] : '' }}" readonly/>
                </div>
                <div class="mb-3 col-md-12">
                    <label class="form-label" for="basic-icon-default-fullname">Content</label>
                    <textarea class="form-control" name="content" id="content" cols="30" rows="10" readonly>{{ isset($data['content']) ? $data['content'] : ''  }}</textarea>
                </div>

            </div>
        </div>
    </div>
</div>
<br>
