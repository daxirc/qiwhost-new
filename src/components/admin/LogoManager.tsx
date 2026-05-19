import React, { useState, useEffect } from 'react';
// Uses /api/assets endpoint
import toast from 'react-hot-toast';

interface Asset {
  id: string;
  file_path: string;
  active: boolean;
  created_at: string;
}

export default function LogoManager() {
  const [logos, setLogos] = useState<Asset[]>([]);
  const [loading, setLoading] = useState(true);
  const [uploading, setUploading] = useState(false);

  useEffect(() => {
    fetchLogos();
  }, []);

  async function fetchLogos() {
    try {
      setLoading(true);
      const res = await fetch('/api/assets?type=logo');
      if (!res.ok) throw new Error('Failed to fetch logos');
      const data = await res.json();
      console.log('Fetched logos:', data);
      setLogos(data || []);
    } catch (error) {
      console.error('Error fetching logos:', error);
      toast.error(`Failed to load logos: ${error.message}`);
    } finally {
      setLoading(false);
    }
  }

  async function handleFileUpload(event: React.ChangeEvent<HTMLInputElement>) {
    const file = event.target.files?.[0];
    if (!file) return;

    // Validate file type
    if (!file.type.startsWith('image/')) {
      toast.error('Please select an image file');
      return;
    }

    // Validate file size (max 5MB)
    if (file.size > 5 * 1024 * 1024) {
      toast.error('File size must be less than 5MB');
      return;
    }

    try {
      setUploading(true);
      
      // For demo purposes, we'll use a placeholder URL
      // In a real implementation, you would upload to cloud storage
      const fileName = `logo-${Date.now()}-${file.name}`;
      const filePath = `/uploads/${fileName}`;
      
      // Insert logo record
      const res = await fetch('/api/assets', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ type: 'logo', file_path: filePath, active: false }),
      });
      if (!res.ok) throw new Error('Failed to upload logo');

      toast.success('Logo uploaded successfully');
      fetchLogos();
    } catch (error) {
      console.error('Error uploading logo:', error);
      toast.error(`Failed to upload logo: ${error.message}`);
    } finally {
      setUploading(false);
      // Reset file input
      event.target.value = '';
    }
  }

  async function setActiveLogo(logoId: string) {
    try {
      // Set active logo via API (handles deactivating others)
      const res = await fetch('/api/assets', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: logoId, type: 'logo' }),
      });
      if (!res.ok) throw new Error('Failed to update active logo');

      toast.success('Active logo updated');
      fetchLogos();
    } catch (error) {
      console.error('Error setting active logo:', error);
      toast.error(`Failed to update active logo: ${error.message}`);
    }
  }

  async function deleteLogo(logoId: string) {
    if (!confirm('Are you sure you want to delete this logo?')) return;

    try {
      const res = await fetch('/api/assets', {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: logoId }),
      });
      if (!res.ok) throw new Error('Failed to delete logo');

      toast.success('Logo deleted successfully');
      fetchLogos();
    } catch (error) {
      console.error('Error deleting logo:', error);
      toast.error(`Failed to delete logo: ${error.message}`);
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center py-12">
        <div className="text-center">
          <div className="w-8 h-8 border-4 border-primary-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-gray-600">Loading logos...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h3 className="text-lg font-semibold text-gray-900">Site Logo Management</h3>
          <p className="text-gray-600 mt-1">Upload and manage your site logos</p>
        </div>
        <div className="relative">
          <input
            type="file"
            accept="image/*"
            onChange={handleFileUpload}
            disabled={uploading}
            className="absolute inset-0 w-full h-full opacity-0 cursor-pointer disabled:cursor-not-allowed"
            id="logo-upload"
          />
          <label
            htmlFor="logo-upload"
            className={`inline-flex items-center px-4 py-2 rounded-lg font-medium transition-colors cursor-pointer ${
              uploading
                ? 'bg-gray-400 text-white cursor-not-allowed'
                : 'bg-primary-600 text-white hover:bg-primary-700'
            }`}
          >
            {uploading ? (
              <>
                <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin mr-2"></div>
                Uploading...
              </>
            ) : (
              <>
                <i className="fas fa-upload mr-2"></i>
                Upload New Logo
              </>
            )}
          </label>
        </div>
      </div>

      {logos.length === 0 ? (
        <div className="text-center py-12 bg-gray-50 rounded-lg border-2 border-dashed border-gray-300">
          <div className="text-gray-400 text-6xl mb-4">
            <i className="fas fa-image"></i>
          </div>
          <h3 className="text-lg font-medium text-gray-900 mb-2">No logos uploaded</h3>
          <p className="text-gray-500 mb-6">Upload your first logo to get started.</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {logos.map((logo) => (
            <div key={logo.id} className="bg-white rounded-lg border border-gray-200 shadow-sm overflow-hidden hover:shadow-md transition-shadow">
              <div className="aspect-w-16 aspect-h-9 bg-gray-100 flex items-center justify-center p-4">
                <img 
                  src={logo.file_path} 
                  alt="Logo" 
                  className="max-w-full max-h-full object-contain"
                  onError={(e) => {
                    e.currentTarget.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZjNmNGY2Ii8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCwgc2Fucy1zZXJpZiIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzlmYTZiNyIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPkxvZ28gUHJldmlldyBOb3QgQXZhaWxhYmxlPC90ZXh0Pjwvc3ZnPg==';
                  }}
                />
              </div>
              <div className="p-4">
                <div className="flex items-center justify-between mb-3">
                  <div className="flex items-center">
                    <span className={`inline-flex rounded-full h-3 w-3 mr-2 ${logo.active ? 'bg-green-500' : 'bg-gray-300'}`}></span>
                    <span className="text-sm font-medium text-gray-700">
                      {logo.active ? 'Active Logo' : 'Inactive'}
                    </span>
                  </div>
                  <div className="text-xs text-gray-500">
                    {new Date(logo.created_at).toLocaleDateString()}
                  </div>
                </div>
                <div className="flex space-x-2">
                  {!logo.active && (
                    <button 
                      className="flex-1 bg-primary-600 text-white text-sm py-2 px-3 rounded hover:bg-primary-700 transition-colors font-medium"
                      onClick={() => setActiveLogo(logo.id)}
                    >
                      <i className="fas fa-check mr-1"></i>
                      Set Active
                    </button>
                  )}
                  <button 
                    className="flex-1 bg-red-600 text-white text-sm py-2 px-3 rounded hover:bg-red-700 transition-colors font-medium"
                    onClick={() => deleteLogo(logo.id)}
                  >
                    <i className="fas fa-trash mr-1"></i>
                    Delete
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
        <div className="flex">
          <div className="flex-shrink-0">
            <i className="fas fa-info-circle text-blue-500"></i>
          </div>
          <div className="ml-3">
            <h3 className="text-sm font-medium text-blue-800">Logo Guidelines</h3>
            <div className="mt-2 text-sm text-blue-700">
              <ul className="list-disc list-inside space-y-1">
                <li>Recommended size: 200x50 pixels or similar aspect ratio</li>
                <li>Supported formats: PNG, JPG, SVG</li>
                <li>Maximum file size: 5MB</li>
                <li>Use transparent background for PNG files</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}