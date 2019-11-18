import React from "react"
import PropTypes from "prop-types"
class Feed extends React.Component {
  render () {
    return (
      <React.Fragment>
      <ul>
        Feed: {this.props.feed.map(({id, title}) => (
          <li>{title}</li>
          ))}
        </ul>
      </React.Fragment>
    );
  }
}

Feed.propTypes = {
  feed: PropTypes.array
};
export default Feed
