import React from "react"
import PropTypes from "prop-types"

class AddFeedButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = { add: false };
  }

  render() {
    if (this.state.add) {
      return 'Formulaire';
    }

    return (
      <button onClick={() => this.setState({ add: true })}>
        Ajouter un flux
      </button>
    );
  }
}

AddFeedButton.propTypes = {
  articles: PropTypes.array
};
export default AddFeedButton
