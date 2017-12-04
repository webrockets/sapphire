import iziToast from 'izitoast'

export default class Toaster {
  constructor() {
    iziToast.settings({
      position: 'topCenter',
      theme: 'dark',
      transitionIn: 'fadeInUp',
      transitionOut: 'fadeOut',
      transitionInMobile: 'fadeInUp',
      transitionOutMobile: 'fadeOutDown',
    })
  }

  success(params) {
    iziToast.success({
      icon: 'fa fa-check',
      ...params
    })
  }

  error(params) {
    iziToast.error({
      icon: 'fa fa-ban',
      ...params
    })
  }

  warning(params) {
    iziToast.warning({
      icon: 'fa fa-exclamation-triangle',
      ...params
    })
  }

  info(params) {
    iziToast.info({
      icon: 'fa fa-info-circle',
      ...params
    })
  }

  show(params) {
    iziToast.show({
      progressBarColor: 'rgba(255, 255, 255, 0.7)',
      ...params
    })
  }
}