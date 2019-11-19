import React from "react"
import PropTypes from "prop-types"

class FeedForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: props.feed.title,
      url: props.feed.url
    };
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleUrlChange = this.handleUrlChange.bind(this);
  }

  handleTitleChange(e) {
    this.setState({ title: e.target.value });
  }

  handleUrlChange(e) {
    this.setState({ url: e.target.value })
  }

  render() {
    return (
      <React.Fragment>
      <label for="feed_title">Title</label>
      <input type="text" name="feed[title]" id="feed_title" value={this.state.title} onChange={this.handleTitleChange} />
      <label for="feed_url">Url</label>
      <input type="text" name="feed[url]" id="feed_url" value={this.state.url} onChange={this.handleUrlChange} />
      <input type="submit" name="commit" value="Create Feed" data-disable-with="Create Feed" />
      </React.Fragment>
      );
  }
}
