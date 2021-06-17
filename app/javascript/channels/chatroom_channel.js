import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        const authorId = Number(data.author_id)
        const currentUserId = Number(document.querySelector("body").dataset.userId)

        const messageContent = authorId === currentUserId ? data.author_message : data.recipient_message

        messagesContainer.insertAdjacentHTML('beforeend', messageContent);

        window.scrollTo(0, document.body.scrollHeight);// called when data is broadcast in the cable
      },
    });
  }
}

export { initChatroomCable };

