function openPopup(link)
{
    link.hide();
    window.open(link.href,'exam_dialog','toolbar=no,location=no,menubar=no,scrollbars=yes,resizable=no');
    return false;
}

var write = function( message ) {
  $('#message').text(
    (message === undefined)? 'none': message
  );  
};

