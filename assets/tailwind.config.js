// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
      './js/**/*.js',
      '../config/*.exs',
      '../lib/support/*_web.ex',
      '../lib/support/*_web/**/*.*ex',
      '../lib/phx_otp_input/*.*ex'
  ],
  safelist: [
      {
        pattern: /./
      }
  ],
  theme: {
      extend: {},
  },
  darkMode: 'class',
  plugins: []
}
