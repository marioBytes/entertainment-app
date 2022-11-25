import_if_available(Ecto.Query)
import_if_available(Ecto.Changeset)

alias Entertainment.Accounts
alias Entertainment.Accounts.{BookmarkedUserVideo, User}
alias Entertainment.Accounts.BookmarkedUserVideo.Query, as: BookmarkedUserVideoQuery
alias Entertainment.Media
alias Entertainment.Media.Video
alias Entertainment.Media.Video.Query, as: VideoQuery
alias Entertainment.Repo
