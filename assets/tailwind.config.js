module.exports = {
  purge: [
    './js/**/*.js',
    '../lib/blog_web/live/**/*.ex',
    '../lib/blog_web/live/**/*.leex',
    '../lib/blog_web/templates/**/*.eex',
    '../lib/blog_web/templates/**/*.leex',
    '../lib/blog_web/views/**/*.ex',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
