

<input type="hidden" id="id" value="{{ isset($id) ? $id : '' }}">


<div class="row">
    <div class="col-md-12 text-end">
        <a href="#" class="dt-button create-new btn btn-secondary" tabindex="0" aria-controls="DataTables_Table_0"
            type="button" onclick="MasterTemplateDoc.back()">
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
        <h5 class="card-header">Form Template Mou</h5>
        <form id="form-template" method="POST">
            <div class="card-body">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <div class="mb-3">
                            <input type="hidden" name="id" id="id"
                                value="{{ isset($data->id) ? $data->id : '' }}">
                            <label class="form-label" for="basic-icon-default-fullname">Nama
                                Template</label>
                            <input type="text" class="form-control required" name="nama_template" id="nama_template"
                                error="Nama template" id="basic-icon-default-fullname" placeholder="Nama Template"
                                aria-label="Nama" aria-describedby="basic-icon-default-fullname2"
                                value="{{ isset($data->nama_template) ? $data->nama_template : '' }}" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label" for="jenis">Pilih Jenis MOU</label>
                            <select id="jenis" name="jenis" class="select2 form-select required"
                                data-allow-clear="true" error="jenis">
                                <option value="{{ isset($data->jenis_doc_id) ? $data->jenis_doc_id : '' }}">
                                    {{ isset($data->nama_jenis) ? $data->nama_jenis : '' }}</option>
                                @foreach ($list_jenis as $item)
                                    <option value="{{ $item->id }}">{{ $item->nama_jenis }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="mb-3 ">
                            <label class="form-label">Upload File</label>
                            <label class="form-label" for="file_doc">Dokumen</label>
                            @if (isset($data->file))
                                @if ($data->file != '')
                                    <div class="input-group">
                                        <button class="btn btn-outline-primary" type="button" id="button-addon1"
                                            onclick="MasterTemplateDoc.takeFile(this, event)">Pilih</button>
                                        <input id="file_doc" src=""
                                            onclick="MasterTemplateDoc.viewFile(this, event)"
                                            path="{{ $data->dokumen_path }}" type="text" class="form-control required"
                                            error="Dokumen" placeholder="Ambil Berkas Dokumen"
                                            aria-label="Ambil Berkas Dokumen" aria-describedby="button-addon1"
                                            value="{{ $data->file }}" readonly>
                                    </div>
                                @else
                                    <div class="input-group">
                                        <button class="btn btn-outline-primary" type="button" id="button-addon1"
                                            onclick="MasterTemplateDoc.takeFile(this, event)">Pilih</button>
                                        <input id="file_doc" src="" type="text"
                                            class="form-control required" error="Dokumen"
                                            placeholder="Ambil Berkas Dokumen" aria-label="Ambil Berkas Dokumen"
                                            aria-describedby="button-addon1" value="" readonly>
                                    </div>
                                @endif
                            @else
                                <div class="input-group">
                                    <button class="btn btn-outline-primary" type="button" id="button-addon1"
                                        onclick="MasterTemplateDoc.takeFile(this, event)">Pilih</button>
                                    <input id="file_doc" src="" type="text" class="form-control required"
                                        error="Dokumen" placeholder="Ambil Berkas Dokumen"
                                        aria-label="Ambil Berkas Dokumen" aria-describedby="button-addon1"
                                        value="" readonly>
                                </div>
                            @endif

                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="basic-icon-default-fullname">Keterangan</label>
                        <div id="keterangan">{!! isset($data->keterangan) ? $data->keterangan : '' !!}</div>
                    </div>
                    <div class="text-end mt-3 mb-3">
                        <button type="button" class="btn btn-primary me-2" onclick="MasterTemplateDoc.submit(this, event)">
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
