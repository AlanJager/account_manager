# app/assets/javascripts/components/record.js.coffee

@Record = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.title
      React.DOM.td null, @props.record.username
      React.DOM.td null, @props.record.password