import { Controller } from "@hotwired/stimulus"

// 選択肢クリック時: 選んだボタンを弾ませてスピナーを表示し、
// 他の選択肢をフェードアウトさせてからフォームを送信する
export default class extends Controller {
  static targets = ["form"]

  submit(event) {
    // 演出後の form.submit() は submit イベントを再発火しないため、
    // ここに再入するのは二度押しのみ → 送信を握りつぶす
    if (this.submitted) {
      event.preventDefault()
      return
    }

    // モーション低減設定時は演出なしでそのまま送信
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return

    event.preventDefault()
    this.submitted = true

    const form = event.currentTarget
    form.querySelector("button[type=submit]").classList.add("answer-selected")

    this.formTargets.forEach((other) => {
      if (other !== form) other.classList.add("answer-dimmed")
    })

    setTimeout(() => form.submit(), 450)
  }
}
