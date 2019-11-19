import React from "react"
import PropTypes from "prop-types"
import Articles from "./Articles"
import Feed from "./Feed"

class Feeds extends React.Component {
  state = { data : [1, "TEST"] }
  render () {
    console.log(this.props.articles);
    return (
      <React.Fragment>
      <h2>Composant react Feeds</h2>
      <h4>Les Flux RSS</h4>
      <ul>
        {this.props.articles.map(({id, title}) => (
          <li key={id}>{title}</li>
        ))}
      </ul>
      <ul>
        {this.props.feeds.map(({id, title}) => (
          <li key={id}>{title}
          <Articles
            dataFromParent={this.props.articles.quotes}
            feed={id} />
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
