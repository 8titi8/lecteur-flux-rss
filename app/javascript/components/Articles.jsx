import React from "react"
import PropTypes from "prop-types"
class Articles extends React.Component {
  render () {
    return (
      <React.Fragment>
      <h3>Composant react Articles</h3>
      <h4>Articles</h4>
      <h4>Feed id: {this.props.feed}</h4>
      <p>Test : {this.props.dataFromParent}</p>

      </React.Fragment>
    );
  }
}

Articles.propTypes = {
  articles: PropTypes.array
};
export default Articles
