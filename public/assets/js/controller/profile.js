let Profile = {
    loadData: () => {
        $('#content-profile').html('');
        let user_id = $('user_id').val();
        $.ajax({
            type: "POST",
            url: "api/loadFormAuth",
            data: {
                'user_id': user_id
            },
            dataType: "html",
            success: function (response) {

            }
        });
    }
}

$(function () {
    // Profile.loadData();

});
