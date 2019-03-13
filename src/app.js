const map = new AMap.Map('map')
const $result = $('#result')

$('#refresh').on('click', () => {
  navigator.geolocation.getCurrentPosition(pos => {
    console.log(pos)
    var crd = pos.coords
    $result.text('Your current position is:Latitude : ' + crd.latitude + 'Longitude: ' + crd.longitude + 'More or less ' + crd.accuracy + ' meters.')

    console.log('Your current position is:')
    console.log('Latitude : ' + crd.latitude)
    console.log('Longitude: ' + crd.longitude)
    console.log('More or less ' + crd.accuracy + ' meters.')
  }, err => {
    $result.text('ERROR(' + err.code + '): ' + err.message)
    console.log(err)
    console.warn('ERROR(' + err.code + '): ' + err.message)
  }, {
    enableHighAccuracy: true,
    timeout: 5000
  })
})
