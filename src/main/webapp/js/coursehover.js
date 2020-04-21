/**
 * 
 */
$('#tableofcourses tbody tr').mouseover(function() {
    $(this).addClass('coursetablehover').siblings().removeClass('coursetablehover');
});

$('#tableofcourses tbody tr').mouseout(function() {
    $(this).removeClass('coursetablehover');
});
