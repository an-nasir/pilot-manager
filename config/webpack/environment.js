const { environment } = require('@rails/webpacker')

import { ProvidePlugin } from 'webpack'
environment.plugins.append(
    'Provide', new ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Pooper:['pooper.js', 'default']
  })
)
export default environment
module.exports = environment
