$(function () {

    $('.widget-list').sortable({

        stop: function (event, ui) {
            var data = $(this).sortable('serialize');
            console.log(data);
            // POST to server using $.post or $.ajax

            $.ajax({
             data: data,
             type: 'POST',
             url: $("#wrapper").data("url")+"/updateorder"
             });
        }
    });




    $( "#sort_toggle" ).click(function(){
        var disabled = $( ".widget-list" ).sortable( "option", "disabled" );
        if(disabled){
            $( ".widget-list").sortable( "option", "disabled", false );
            $( "#pin_sortable" ).toggle();
        }
        else{
            $( ".widget-list").sortable( "option", "disabled", true );
            $( "#pin_sortable" ).toggle();
        }
    });

    //$( "#sortable" ).sortable();
    $( ".widget-list" ).disableSelection();


});
