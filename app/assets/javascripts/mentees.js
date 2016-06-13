$(document).ready(function(){
  console.log("things");
  $( '#challenge1' ).change(function(){
    console.log("yeee")
    c1 = $(this).val();
    $('#challenge2 option').show();
    $('#challenge3 option').show();
    $( '#challenge2 option[value="' + c1 + '"]' ).hide();
    $( '#challenge3 option[value="' + c1 + '"]' ).hide();
  });

  $( '#challenge2' ).change(function(){
    c2 = $(this).val();
    $('#challenge1 option').show();
    $('#challenge3 option').show();
    $( '#challenge1 option[value="' + c2 + '"]' ).hide();
    $( '#challenge3 option[value="' + c2 + '"]' ).hide();
  });

  $( '#challenge3' ).change(function(){
    c3 = $(this).val();
    $('#challenge1 option').show();
    $('#challenge2 option').show();
    $( '#challenge1 option[value="' + c3 + '"]' ).hide();
    $( '#challenge2 option[value="' + c3 + '"]' ).hide();
  });
});