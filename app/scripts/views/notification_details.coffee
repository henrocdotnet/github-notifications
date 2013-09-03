class app.Views.NotificationDetailsView extends Backbone.View
  el: '#details'
  template: JST['app/scripts/templates/notification_details.ejs']

  initialize: ->
    @render()
    @listenTo @model.subject, 'change', @renderSubject
    @model.subject.fetch()

  render: ->
    @model.trigger 'selected'
    @$el.html @template(@model.toJSON())
    @

  renderSubject: (subject) ->
    view = new app.Views[subject.get('type')](model: subject)
    @$('.subject').html(view.render().el)