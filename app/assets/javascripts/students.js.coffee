# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$ ->
  jDepartmentSelector = $('#department')
  jGroupSelector = $("#group")
  jGroupsMap = $('.department').data("departments")

  if !jDepartmentSelector.length
    jDepartmentSelector = $('#user_department_id')
    jGroupSelector = $("#group")
    jGroupsMap = $('.department').data("departments")


  jDepartmentSelector.change ->
    text = $('#department option:selected').text()
    rawData = jGroupsMap
    courses = Object.keys(rawData[text])
    options = $('#course option')

    $('.course').removeClass("hidden")
    $('#course').val("")

    for option in options
      do (option) ->
        unless $(option).text().toString() in courses
          $(option).attr({ disabled: 'disabled' })


  $('#course').change ->
    currentCourse = $('#course').val()
    currentDepartment = $('#department option:selected').text()
    jGroupSelector.html(jGroupsMap[currentDepartment][currentCourse])
    $('.group').removeClass("hidden")
    $('.action').removeClass("hidden")


  $('.mark-select').select2()
  $('.cell').change ->
    id = $(this).parent().data("studentId")
    field = $(this).data("fieldName")
    value = $(this).children('select').val()
    req = {
      url: "/students/" + id,
      type: 'PUT',
      data: {
        student: {
        }
      }
    }
    req["data"]["student"][field] = value
    $.ajax(req)

  $('.mark').change ->
    id = $(this).parent().data("studentId")
    semester = if $(this).hasClass("i-sem") then "i-sem" else "ii-sem"
    markObjects = $(this).parent().find(".mark." + semester)

    values = []
    for mark in markObjects
      values.push $(mark).children('select').val()

    if semester == "i-sem"
      title = "first_sem_seminars"
    else
      title = "second_sem_seminars"


    req = {
      url: "/students/" + id,
      type: 'PUT',
      data: {
        student: {
        }
      }
    }
    req["data"]["student"][title] = values
    $.ajax(req)
