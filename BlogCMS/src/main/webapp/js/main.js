/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$('a[rel=popover]').popover({
//    html: 'true',
//placement: 'bottom'
//});

$('.popover-markup>.trigger').popover({
    html: true,
    title: function () {
        return $(this).parent().find('.head').html();
    },
    content: function () {
        return $(this).parent().find('.content').html();
    }
});