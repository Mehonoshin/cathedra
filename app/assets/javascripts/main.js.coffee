$ ->
  jDepartmentSelector = $('#user_department_id')
  jGroupSelector = $("#user_group")
  jGroupsMap = $('.department').data("departments")
  jUserRole = $('input[name="user[user_role]"]')

  $('.role').click ->
    role = $(this).val()
    if (role == "tutor")
      $('.student-fields').hide()
    else
      $('.student-fields').show()


  jDepartmentSelector.change ->
    text = $('#user_department_id option:selected').text()
    rawData = jGroupsMap
    courses = Object.keys(rawData[text])
    options = $('#user_course option')

    $('.course').removeClass("hidden")
    $('#user_course').val("")

    for option in options
      do (option) ->
        unless $(option).text().toString() in courses
          $(option).attr({ disabled: 'disabled' })


  $('#user_course').change ->
    currentCourse = $('#user_course').val()
    currentDepartment = $('#user_department_id option:selected').text()
    jGroupSelector.html(jGroupsMap[currentDepartment][currentCourse])
    $('.group').removeClass("hidden")
    $('.action').removeClass("hidden")

