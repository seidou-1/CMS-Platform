$('#addCat-btn').click(function (event) {
   console.log(performAjaxCall('categories', '', 'GET'));

});

function performAjaxCall(endpoint, extraParameter, ajaxType) {
    var returnData;

    $.ajax({
        async: false,
        type: ajaxType,
        url: `http://localhost:8080/Blogcms/${endpoint}/${extraParameter}`,
        data: function() {
            return JSON.stringify({
                categoryName: $('#add-categoryName').val()
            })
        },
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        'dataType': 'json',
        success: function (data, status) {
            returnData = data;
        },
        error: function () {
            returnData = null;
        }
    });
    return returnData;
}
