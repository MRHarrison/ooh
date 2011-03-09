<ul>
  <li class="message">
    <span class="content"><%= micropost.content %></span>
    <span class="timestamp">
      Posted <%= time_ago_in_words(micropost.created_at) %> ago.
    </span>
  </li>
  <% user = micropost.user rescue User.find(micropost.user_id) %>
  <% if current_user?(user) %>
    <li>
      <%= link_to "delete", micropost, :method => :delete,
                                       :confirm => "You sure?",
                                       :title => micropost.content %>
    </li>
  <% end %>
</ul>