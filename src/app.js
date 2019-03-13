const map = new AMap.Map('map')
const $result = $('#result')

$('#refresh').on('click', e => {
  e.target.disabled = true
  $result.text('正在定位')
  navigator.geolocation.getCurrentPosition(pos => {
    var crd = pos.coords
    // $result.text('Your current position is:Latitude : ' + crd.latitude + 'Longitude: ' + crd.longitude + 'More or less ' + crd.accuracy + ' meters.')
    getAddressByCoord(crd.longitude + ',' + crd.latitude).then(res => {
      $result.text(res)
      e.target.disabled = false
    }).catch(err => {
      $result.text('定位失败,ERROR:' + err)
      e.target.disabled = false
    })
  }, err => {
    $result.text('定位失败，ERROR(' + err.code + '): ' + err.message)
    e.target.disabled = false
  }, {
    enableHighAccuracy: true,
    timeout: 5000
  })
})

const getAddressByCoord = crd => new Promise((resolve, reject) => {
  $.get(`https://restapi.amap.com/v3/geocode/regeo?location=${crd}&key=75f3b7939d94820dbef38cb10dc42b27`, res => {
    if (res.status === '1') {
      resolve(typeof res.regeocodes.formatted_address === 'string' ? res.regeocodes.formatted_address : res.regeocodes.formatted_address.join(''))
    } else {
      reject(res.info)
    }
  })
})
