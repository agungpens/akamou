<input type="hidden" id="id" value="{{ isset($id) ? $id : '' }}">
<div class="row">
    <div class="col-md-12 text-end">
        <a href="#" class="dt-button create-new btn btn-secondary" tabindex="0" aria-controls="DataTables_Table_0"
            type="button" onclick="DokumenMoa.back()">
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
        <h5 class="card-header">Form Document Moa</h5>
        <div class="row form g-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <label class="form-label" for="basic-icon-default-fullname">Relevansi Dokumen MOU
                            (Optional)</label>
                        <div class="input-group mb-3">
                            <button class="btn btn-outline-primary" type="button" id="button-addon1"
                                onclick="DokumenMoa.showDataMou(this, event)">Pilih</button>
                            <input id="nomor_mou" src="" type="text" class="form-control"
                                placeholder="Pilih data dokumen mou" aria-label="Pilih data dokumen mou"
                                aria-describedby="button-addon1" value="" readonly>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label for="" class="mb-3"> TABLE TAMBAH DATA MOA </label>
                        <div class="table-responsive pt-0">
                            <div class="col-12">
                                <div class="alert alert-warning"><b>
                                        <i class="fa fa-warning"></i> Perhatian</b>
                                    Tombol delete <i class="bx bx-trash"> </i> didalam table hanya berfungsi untuk
                                    manghapus data kolom saja
                                </div>
                                <table id="doc_moa" class="table table-bordered mt-3">
                                    <thead>
                                        <tr>
                                            <th>
                                                File
                                                <br>
                                                Status
                                            </th>
                                            <th>Nomor MOA</th>
                                            <th>
                                                Kerja Sama Dengan
                                                <br>
                                                Relevansi Prodi
                                            </th>
                                            <th>
                                                Masa Berlaku Tanggal
                                            </th>
                                            <th>
                                                Kategori
                                                <br>
                                                Level
                                                <br>
                                                Jenis
                                            </th>
                                            <th style="width: 10px">ACTION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="7">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                    onclick="DokumenMoa.addItem(this, event)">
                                                    <i class="fa fa-plus-circle"></i> Tambah
                                                </button>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-end mt-3 mb-3">
                    <button type="button" class="btn btn-primary me-2" onclick="DokumenMoa.submit(this, event)">
                        <span><i class="bx bx-check-circle me-sm-2"></i>
                            <span class="d-none d-sm-inline-block">Submit</span>
                        </span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
