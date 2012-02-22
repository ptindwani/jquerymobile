# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Attendee
  include Rhom::FixedSchema

  # rhoconnect settings
  # Enable sync for this model.
  # Default is disabled.
  # enable :sync 

  # Set the type of sync this model
  # will use (default :incrmental).
  # Set to :bulk_only to disable incremental
  # sync and only use bulk sync.
  set :sync_type, :bulk_only 

  # Set the sync priority for this model.
  # 1000 is default, set to lower number
  # for a higher priority.
  set :sync_priority, 1     

  # Instruct Rhom to send all attributes
  # to RhoConnect when an object is updated.
  # Default is disabled, only changed attributes
  # are sent.
  enable :full_update 

  # RhoConnect provides a simple way to keep data out of redis. 
  # If you have sensitive data that you do not want saved in redis, 
  # add the pass_through option in settings/settings.yml for each source.
  # Add pass_through to client model definition
  enable :pass_through 

  # model settings

  # Define how data is partitioned for this model.
  # Default is :user.  If you have an :app partition
  # for your RhoConnect source adapter and use bulk sync,
  # set this to :app also.
  set :partition, :app

  # Set the current version of the fixed schema.
  # Your application may use it for data migrations.
  set :schema_version, '1.0'

  # Define fixed schema attributes.
  # :string and :blob types are supported.
  property :name, :string
  property :tag, :string
  property :email, :string
  property :image_url, :blob

  # Define a named index on a set of attributes.
  # For example, this will create index for name and tag columns.
  index :by_name_tag, [:name, :tag] 

  # Define a unique named index on a set of attributes.
  # For example, this will create unique index for the email column.
  unique_index :by_email, [:email] 

  # Define blob attributes for the model.
  # :blob           Declare property as a blob type
  #
  # :overwrite      (optional) Overwrite client copy 
  #                 of blob with new copy from server.
  #                 This is useful when RhoConnect modifies
  #                 images sent from Rhodes, for example 
  #                 zooming or cropping.
  property :image_url, :blob, :overwrite

  # You can define your own properties also
  property :mycustomproperty, 'hello'
end
