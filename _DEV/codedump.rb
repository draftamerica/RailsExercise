<% puts "/***user****, #{user.inspect}" %>
<td><%= link_to user.username + " " + user.password, user_path(user) %></td>
<td><%= link_to 'Edit', edit_user_path(user) %></td>
<td><%= link_to 'Destroy', user, method: :delete, data: { confirm: 'Are you sure?' } %></td>

<%= # link_to 'New Post', new_user_post_path(@user) %>

<%= form_for([@user, @post]) do |form| %>

    <%= form_with (url: "/new_user_post", method: "post") do |form| %>
        <div><%= label :title, "title" %><%= form.text_field :title %></div>
        <div><%= label :content, "content" %><%= form.text_field :content %></div>
        <div><%= form.submit "Submit" %></div>
    <% end %>
