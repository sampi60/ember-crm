App.LeadsController = Ember.ArrayController.extend
  sortProperties: ['firstName', 'lastName']

  leads: (->
    if @get('search') then @get('searchLeads') else @
  ).property('search', 'searchLeads')

  searchLeads: (->
    search = @get('search').toLowerCase()
    @filter (lead) => lead.get('fullName').toLowerCase().indexOf(search) != -1
  ).property('search', '@each.fullName')
