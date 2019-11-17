import React from "react"
import PropTypes from "prop-types"
class Feeds extends React.Component {
  render () {
    return (
      <React.Fragment>
      <h2>Composant react Feeds</h2>
      <h4>Les Flux RSS</h4>
      <ul>
        {this.props.feeds.map(({id, title}) => (
          <li key={id}>{title}
          <div>{this.props.children}</div>
          </li>
        ))}
      </ul>
      </React.Fragment>
    );
  }
}

Feeds.propTypes = {
  feeds: PropTypes.array
};
export default Feeds
