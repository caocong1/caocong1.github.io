var json = [{
  storename:11,
  dmac:222,
  smac:333,
  time:444,
  riss:555
}]
// $.getJSON ("data.json",res=>{
//   json = res
// })
$.mockjax({
  url:'/now',
  responseText: json
})