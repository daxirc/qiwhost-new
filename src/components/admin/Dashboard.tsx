import React, { useState } from 'react';
import PlansManager from './PlansManager.tsx';
import LogoManager from './LogoManager';
import { Toaster } from 'react-hot-toast';
import { supabase } from '../../lib/supabase';

export default function Dashboard({ session }) {
  const [activeTab, setActiveTab] = useState('vps');

  const handleSignOut = async () => {
    await supabase.auth.signOut();
  };

  const menuItems = [
    { id: 'vps', label: 'VPS Plans', icon: 'fas fa-server' },
    { id: 'rdp', label: 'RDP Plans', icon: 'fas fa-desktop' },
    { id: 'dedicated', label: 'Dedicated Servers', icon: 'fas fa-hdd' },
    { id: 'logo', label: 'Site Logo', icon: 'fas fa-image' },
  ];

  return (
    <div className="min-h-screen bg-gray-50 flex">
      <Toaster position="top-right" />
      
      {/* Sidebar */}
      <div className="w-64 bg-white shadow-lg fixed h-full z-10">
        <div className="flex flex-col h-full">
          {/* Logo */}
          <div className="p-6 border-b border-gray-200">
            <div className="flex items-center">
              <div className="w-10 h-10 bg-primary-600 rounded-lg flex items-center justify-center mr-3">
                <i className="fas fa-cog text-white text-lg"></i>
              </div>
              <div>
                <h1 className="text-xl font-bold text-gray-900">Admin Panel</h1>
                <p className="text-sm text-gray-500">QIW HOST</p>
              </div>
            </div>
          </div>

          {/* User Profile */}
          <div className="p-6 border-b border-gray-200">
            <div className="flex items-center space-x-3">
              <div className="w-10 h-10 bg-primary-100 rounded-full flex items-center justify-center">
                <i className="fas fa-user text-primary-600"></i>
              </div>
              <div className="flex-1 min-w-0">
                <div className="font-medium text-gray-900 truncate">Administrator</div>
                <div className="text-sm text-gray-500 truncate">{session.user.email}</div>
              </div>
            </div>
          </div>

          {/* Navigation */}
          <nav className="flex-1 p-4">
            <div className="space-y-2">
              {menuItems.map((item) => (
                <button
                  key={item.id}
                  onClick={() => setActiveTab(item.id)}
                  className={`w-full flex items-center space-x-3 px-4 py-3 rounded-lg transition-all duration-200 ${
                    activeTab === item.id
                      ? 'bg-primary-50 text-primary-600 border-r-2 border-primary-600'
                      : 'text-gray-600 hover:bg-gray-50 hover:text-gray-900'
                  }`}
                >
                  <i className={item.icon}></i>
                  <span className="font-medium">{item.label}</span>
                </button>
              ))}
            </div>
          </nav>

          {/* Sign Out Button */}
          <div className="p-4 border-t border-gray-200">
            <button
              onClick={handleSignOut}
              className="w-full flex items-center justify-center space-x-2 px-4 py-3 text-red-600 hover:bg-red-50 rounded-lg transition-colors font-medium"
            >
              <i className="fas fa-sign-out-alt"></i>
              <span>Sign Out</span>
            </button>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 ml-64">
        <div className="p-8">
          {/* Header */}
          <div className="mb-8">
            <div className="flex items-center justify-between">
              <div>
                <h1 className="text-3xl font-bold text-gray-900">
                  {menuItems.find(item => item.id === activeTab)?.label}
                </h1>
                <p className="text-gray-600 mt-1">
                  Manage your {activeTab === 'logo' ? 'site branding' : 'hosting plans'} and pricing
                </p>
              </div>
              <div className="flex items-center space-x-4">
                <div className="text-sm text-gray-500">
                  Last updated: {new Date().toLocaleDateString()}
                </div>
                <div className="w-2 h-2 bg-green-500 rounded-full"></div>
                <span className="text-sm text-green-600 font-medium">Connected</span>
              </div>
            </div>
          </div>

          {/* Content */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
            {activeTab === 'logo' ? (
              <LogoManager />
            ) : (
              <PlansManager category={activeTab.toUpperCase()} />
            )}
          </div>
        </div>
      </div>
    </div>
  );
}