// function uploadCSV () {
//   $(document).on("submit", "form", function(event){
//     event.preventDefault();
//
//     var data = new FormData();
//
//     var file = $('#file')[0].files[0]
//
//     if (typeof file != "undefined"){
//     } else {
//       return alert("Please select a file to upload")
//     }
//
//     data.append('file', file);
//
//     var request = $.ajax({
//       type: 'post',
//       url: '/teachers/upload',
//       data: data,
//       processData: false,
//       contentType: false,
//     });
//
//     request.done(function(response){
//       alert(response);
//     });
//
//     request.fail(function(response) {
//       alert("Please contact admin.")
//     });
//
//   });
// }
